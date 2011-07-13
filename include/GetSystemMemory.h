#pragma once

#ifndef GETSYSTEMMEMORY_H

#define GETSYSTEMMEMORY_H

/** Returns the system memory
 *
 * Runs platform independant (on apple and linux anyway)
 * method of getting the system memory (RAM) in bytes
 *
 */
long getTotalSystemMemory();


#endif /* end of include guard: GETSYSTEMMEMORY_H */
