from machine import I2C, Pin
import ustruct

i2c = I2C(sda=Pin(23), scl=Pin(22), freq=400000)

table = {
        "CHPID": (0, 15, 8),
        "DHIZ": (2, 15, 15),
        "DMUTE": (2, 14, 14),
        "MONO": (2, 13, 13),
        "BASS": (2, 12, 12),
        "RCLK_NCAL": (2, 11, 11),
        "RCLK_DIM": (2, 10, 10),
        "SEEKUP": (2, 9, 9),
        "SEEK": (2, 8, 8),
        "SKMODE": (2, 7, 7),
        "CLK_MODE": (2, 6, 4),
        "RDS_EN": (2, 3, 3),
        "NEW_METHOD": (2, 2, 2),
        "SOFT_RESET": (2, 1, 1),
        "ENABLE": (2, 0, 0),
        "CHAN": (3, 15, 6),
        "DIRECT_MODE": (3, 5, 5),
        "TUNE": (3, 4, 4),
        "BAND": (3, 3, 2),
        "SPACE": (3, 1, 0),
        "DEEMPH": (4, 11, 11),
        "SOFTMUTE": (4, 9, 9),
        "AFCD": (4, 8, 8),
        "INT_MODE": (5, 15, 15),
        "SEEKTH": (5, 11, 8),
        "LNA_PORT": (5, 7, 6),
        "VOLUME": (5, 3, 0),
        "OPEN_MODE": (6, 14, 13),
        "TH_SOFTBLEND": (7, 14, 10),
        "SEEKTH_OLD": (7, 7, 2),
        "SOFTBLEND": (7, 1, 1),
        "FREQ_MODE": (7, 0, 0),
        "RDSR": (10, 15, 15),
        "STC": (10, 14, 14),
        "SF": (10, 13, 13),
        "RDSS": (10, 12, 12),
        "BLK_E": (10, 11, 11),
        "ST": (10, 10, 10),
        "READCHAN": (10, 9, 0),
        "RSSI": (11, 15, 9),
        "FMTRUE": (11, 8, 8),
        "FMREADY": (11, 7, 7),
        "ABCD_E": (11, 4, 4),
        "BLERA": (11, 3, 2),
        "BLERB": (11, 1, 0),
        "FREQDIRECT": (8, 15, 0)
}

class Radio(object):
    def __init__(self, address):
        self.address = address

    def reset(self):
        self.write("SOFT_RESET", 1)

    def setup(self, mono = 1, volume = 15):
        self.write_multiple({
            "DHIZ": 1,
            "DMUTE": 1,
            "MONO": mono,
            "NEW_METHOD": 1,
            "ENABLE": 1,
            "SPACE": 0,
            "SOFTMUTE": 0,
            "VOLUME": volume,
            "SEEKTH": 2,
            "LNA_PORT": 2})

    def set_freq(self, khz100):
        band = 2
        offset = 760
        if khz100 < 760:
            band = 3
            offset = 650
        if khz100 > 1080 or khz100 < offset:
            return
        self.write_multiple({
            "BAND":  band,
            "SPACE": 0,
            "CHAN":  khz100 - offset,
            "TUNE":  1})

    def set_volume(self, vol):
        self.write("VOLUME", vol)

    def wreg(self, register, data):
        data = ustruct.pack('>H', data)
        i2c.writeto_mem(self.address, register, data)

    def rreg(self, register, l = 2, p=True):
        data = i2c.readfrom_mem(self.address, register, l)
        if p: print(" ".join("%02x" % (x,) for x in data))
        return ustruct.unpack(">H", data)[0]

    def read(self, name, p=True):
        reg, max, min = table[name]
        data = self.rreg(reg, 2, False)
        data = (data >> min) & ((1<<(max + 1 - min))-1)
        if p: print("%s: hex %x dec %d" % (name, data, data))
        return data

    def read_multiple(self, names, p=True):
        return [self.read(n, p) for n in names]

    def write(self, name, value):
        reg, max, min = table[name]
        data = self.rreg(reg, 2, False)
        data = self.set_data(data, max, min, value)
        self.wreg(reg, data)

    def write_multiple(self, dict):
        data = {}
        for name, value in dict.items():
            r, x, n = table[name]
            data[r] = self.set_data(data.get(r, 0), x, n, value)
        for r in sorted(data):
            print("%02x: %04x" % (r, data[r]))
            self.wreg(r, data[r])

    def set_data(self, data, max, min, val):
        mask = ((1<<(max+1-min)) - 1) << min
        data = (data & ~mask) | (val << min)
        return data

    def print_all(self):
        for n in sorted(table):
            self.read(n)

