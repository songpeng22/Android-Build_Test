# build mode
BUILD_MODE=arm64
ifeq ($(BUILD_MODE),x86)
CC=g++
AR=ar
else ifeq ($(BUILD_MODE),arm64)
# all toolchain defines
CC=aarch64-linux-android21-clang++
AR=llvm-ar
else
CC=g++
AR=ar
endif

# all objects defines
SRCS:=$(wildcard src/*.cpp)
OBJS:=$(SRCS:.cpp=.o)
DEPS:=$(SRCS:.cpp=.d)
DEFINE=
# -I /usr/aarch64-linux-gnu/include 
INCLUDE=-I ./include
CXX_FLAGS=-c -fPIC -g 

$(info SRCS is ${SRCS})
$(info OBJS is ${OBJS})
$(info DEPS is ${DEPS})

all:$(OBJS) 
	$(CC) -shared -o libTest1.so $(OBJS) -l log
%.o:%.cpp
	@echo "Compiling: $< -> $@"
	$(CC) $(DEFINE) $(INCLUDE) $(CXX_FLAGS) -o $*.o $<

clean:
	rm -f src/*.o src/*.d *.so *.a

