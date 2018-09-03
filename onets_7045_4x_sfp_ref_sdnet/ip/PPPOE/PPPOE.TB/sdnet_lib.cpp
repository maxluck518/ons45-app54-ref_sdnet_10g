#include "sdnet_lib.hpp"


namespace SDNET {

// ############################################################################
// hex byte helper with leading zero
std::string padHexByte(unsigned char b) {
    std::string r(2, '0');
    r[0] = (b >> 4) + '0'; if (r[0] > '9') r[0] += 'a' - '0' - 10;
    r[1] = (b % 16) + '0'; if (r[1] > '9') r[1] += 'a' - '0' - 10;
    return r;
}


std::ostream& operator<<(std::ostream& os, const Packet& pkt) {
    const int R = 16;
    int b,r,c; // byte row col
    for (b = 0, r = 0; b < pkt.size(); r++) {
        os << std::setw(10) << _LV<16>(r*R) << " : ";
        for (c = 0; c < R && b < pkt.size(); c++, b++) {
            os << padHexByte(pkt[b]) << " ";
        }
        os << "\n";
    }
    return os;
}

void printPacketSlice(std::ostream& stream, const Packet& pkt, size_t from, size_t to) {
    const int R = 16;
    int b,r,c; // byte row col
    for (b = from - from%R, r = from/R; b < to; r++) {
        stream << std::setw(10) << _LV<16>(r*R) << " : ";
        for (c = 0; c < R && b < to; c++, b++) {
            if (b < from)
                stream << "   ";
            else
                stream << padHexByte(pkt[b]) << " ";
        }
        stream << "\n";
    }
}

void busFormatPacket(std::ostream& stream, const Packet& packet, int bus_width, bool isAXI) { 
    int bus_width_byte = bus_width / 8; 
    int keep_str_length = (bus_width + 31) / 32; 
    int numWords = (packet.size() + bus_width_byte - 1) / bus_width_byte; 

    int lastMty = (bus_width_byte - packet.size() % bus_width_byte) % bus_width_byte; 
    // max bus is 1024, max keep is 128 bits
    _LV<128> lastKeep(std::string(lastMty, '0') + std::string(bus_width_byte - lastMty, '1'), 2);  // little Endian
    _LV<128> fullKeep(std::string(bus_width_byte, '1'), 2); 
    
    if (packet.empty()) {
        if (!isAXI) 
            // sop eop err mty
            stream << "1 1 1 0 "; // force the error bit on LBUS to detect empty packet

        else { 
            // tlast tkeep
            stream << "1 " << std::string(keep_str_length, '0') << " " ; 
        }
        // data
        stream << std::string(bus_width_byte*2, '0') << std::endl; 
        return;
    }

    int packet_byte = 0;
    for (int word=0; word<numWords; word++) { 
        bool sop = (word == 0);
        bool eop = (word == numWords - 1);
        int  mty = eop ? lastMty : 0;
        
        if (!isAXI) {
            // sop eop err mty
            stream << sop << ' ' << eop << " 0 " << std::hex << mty << ' '; 
        }
        else { 
            // tlast tkeep
            if (eop) {
                stream << "1 " << lastKeep.to_hex().substr(128/4 - keep_str_length) << ' ';
            }
            else {
                stream << "0 " << fullKeep.to_hex().substr(128/4 - keep_str_length) << ' '; 
            }
        } 
        // data
	if (!isAXI) {
            for (int byte=0; byte<bus_width_byte && packet_byte<packet.size(); byte++, packet_byte++) {
                stream << _LV<8>(packet[packet_byte]).to_hex(); 
            }
            if (eop) {
                stream << std::string(lastMty*2, '0'); // trailing zeroes in partial last cycle
            }
	} else {
  	    // reverse data byte order for little Endian
            if (eop) {
                stream << std::string(lastMty*2, '0'); // trailing zeroes in partial last cycle
            }
	    for (int byte=0; byte<bus_width_byte && packet_byte<packet.size(); byte++, packet_byte++) {
	      int inx;
              if (eop) {
                  inx = word*bus_width_byte + (bus_width_byte-1) - byte - lastMty;
	      } else {
                  inx = word*bus_width_byte + (bus_width_byte-1) - byte;
	      }
  	      stream << _LV<8>(packet[inx]).to_hex(); 
            }            
	}        
        stream << std::dec << std::endl; 
    } 
} 

// Read an input packet in TEXT format from the input stream
// Skip spaces, commented lines
// Input packet is terminated by ";" character
Packet ReadPacket(std::istream& fin) { 
    std::string line; 
    char c; 
    Packet packet;
    bool byteBoundary = true;
    unsigned char byte = 0; 

    while(std::getline(fin, line)) { 
        // Trim leading white space(s) 
        line.erase(line.begin(), std::find_if(line.begin(), line.end(), not1(std::ptr_fun<int, int>(std::isspace)))); 

        //Skip commented line
        if (line[0] == '%') 
            continue; 

        std::istringstream ss (line); 

        while (ss.get(c)) { 
            // eop
            if (c == ';')
                return packet;
 
            // skip non hex
            if (!isxdigit(c)) 
                continue;

            byteBoundary = !byteBoundary;
            switch (tolower(c)) {
                case '0': byte = (byte << 4) | 0x0; break;
                case '1': byte = (byte << 4) | 0x1; break;
                case '2': byte = (byte << 4) | 0x2; break;
                case '3': byte = (byte << 4) | 0x3; break;
                case '4': byte = (byte << 4) | 0x4; break;
                case '5': byte = (byte << 4) | 0x5; break;
                case '6': byte = (byte << 4) | 0x6; break;
                case '7': byte = (byte << 4) | 0x7; break;
                case '8': byte = (byte << 4) | 0x8; break;
                case '9': byte = (byte << 4) | 0x9; break;
                case 'a': byte = (byte << 4) | 0xa; break;
                case 'b': byte = (byte << 4) | 0xb; break;
                case 'c': byte = (byte << 4) | 0xc; break;
                case 'd': byte = (byte << 4) | 0xd; break;
                case 'e': byte = (byte << 4) | 0xe; break;
                case 'f': byte = (byte << 4) | 0xf; break;
            }
            if (byteBoundary) {
                packet.push_back(byte); 
                byte = 0;
            }
        } 
    } 
    return packet;
} 

// Read an input packet in PCAP format from the input stream
Packet ReadPcapPacket(std::istream &fin, bool swapped) { 
    Packet packet; 
    pcaprec_hdr_s rHeader; 

    fin.read((char*) &rHeader, sizeof(rHeader));    
    if (fin.eof() || fin.bad() || fin.fail()) 
        return packet; 

    if (swapped) 
        rHeader.incl_len = ((rHeader.incl_len & 0xFF) << 24) | ((rHeader.incl_len & 0xFF00) << 8) | ((rHeader.incl_len >> 8) & 0xFF00) | ((rHeader.incl_len >> 24) & 0xFF); 

    uint8_t *s = new uint8_t[rHeader.incl_len]; 

    fin.read((char*) s, rHeader.incl_len);  
    if (fin.eof() || fin.bad() || fin.fail()) { 
        delete[] s; 
        return packet; 
    } 

    for (unsigned int i=0; i<rHeader.incl_len; i++) 
        packet.push_back(s[i]); 

    delete[] s; 
    return packet; 
} 

// Read PCAP global header from the input stream
bool ReadPcapGlobalHeader(std::istream& fin, bool& swapped) { 
    pcap_hdr_s gHeader; 
    fin.read((char*) &gHeader, sizeof(gHeader)); 

    // Check if valid pcap file
    if (gHeader.magic_number != 0xd4c3b2a1 && gHeader.magic_number != 0xa1b2c3d4) 
        return false; 

    // Check if little or big endian
    swapped = (gHeader.magic_number == 0xd4c3b2a1) ? true : false; 

    return true; 
} 

// Write PCAP global header to the output stream
void WritePcapGlobalHeader(std::ostream& fout);
void WritePcapGlobalHeader(std::ostream& fout) {
    pcap_hdr_s gHeader;
    gHeader.magic_number    =   0xa1b2c3d4;
    gHeader.version_major   =   2;
    gHeader.version_minor   =   4;
    gHeader.thiszone        =   0;
    gHeader.sigfigs         =   0;
    gHeader.snaplen         =   0x10000;
    gHeader.network         =   1;          // Ethernet

    fout.write((char*) &gHeader, sizeof(gHeader));
}

// Write packet output in PCAP format to the output stream
void WritePcapPacket(std::ostream& fout, const Packet& packet) {
    pcaprec_hdr_s rHeader;

    rHeader.ts_sec          =   time(NULL);
    rHeader.ts_usec         =   0;
    rHeader.incl_len        =   packet.size();
    rHeader.orig_len        =   packet.size();

    fout.write((char*) &rHeader, sizeof(rHeader));

    uint8_t *s = new uint8_t[rHeader.incl_len];
    for (unsigned int i=0; i<rHeader.incl_len; i++)
        s[i] = packet[i];

    fout.write((char*) s, rHeader.incl_len);
}

// ############################################################################

}
