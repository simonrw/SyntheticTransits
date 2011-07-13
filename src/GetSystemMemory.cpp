#include "GetSystemMemory.h"
#ifdef __APPLE__
#include <sys/types.h>
#include <sys/sysctl.h>
#else
#include <unistd.h>
#endif

long getTotalSystemMemory()
{
#ifndef __APPLE__
    long pages = sysconf(_SC_PHYS_PAGES);
    long page_size = sysconf(_SC_PAGE_SIZE);
    long memsize = pages * page_size;
#else
    int mib[2]; 
    long memsize = 0;
    mib[0] = CTL_HW;
    mib[1] = HW_MEMSIZE;
    size_t len = sizeof(memsize);
    sysctl(mib, 2, &memsize, &len, NULL, 0);
#endif

    return memsize;
}
