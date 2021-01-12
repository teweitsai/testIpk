# Macros
TARGET := hellowWorld.ipk
FS_DIR_NAME := hellowWorld
IPK_TEMP := ipk

# Create the ipk file
$(TARGET):
	mkdir -p $(IPK_TEMP)/rubin/$(FS_DIR_NAME)
	cp bin/* $(IPK_TEMP)/rubin/$(FS_DIR_NAME)
	tar czvf control.tar.gz control
	cd $(IPK_TEMP); tar czvf ../data.tar.gz .; cd ..
	echo 2.0 > debian-binary
	ar r $(TARGET) control.tar.gz data.tar.gz debian-binary

.PHONY: all clean

all: $(TARGET)

clean:
	rm -rf $(IPK_TEMP)/
	rm -f control.tar.gz debian-binary
	rm -f data.tar.gz
	rm -f $(TARGET)
