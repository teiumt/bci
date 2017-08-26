C_IFLAGS="-I8xdrm/inc -Ieint_t/inc"
C_LFLAGS="-L8xdrm/lib"
DEFINES="-D__DEBUG_ENABLED"
cd 8xdrm;
sh compile.sh -I../eint_t/inc

cd ../;

rm -f bci.o bin/bci
gcc -c $C_IFLAGS $DEFINES -std=c11 -o bci.o bci.c

ar rc lib/libbci.a bci.o
cp bci.h inc

gcc -Iinc -Llib $C_IFLAGS $C_LFLAGS $DEFINES -std=gnu11 -o bin/bci main.c -lbci -l8xdrm