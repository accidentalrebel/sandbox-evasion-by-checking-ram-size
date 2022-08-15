#include <stdio.h>
#include <windows.h>

int main(void)
{
	// Getting RAM Size using GetPhysicallyInstalledSystemMemory
	unsigned long long size = 0;
	if ( !GetPhysicallyInstalledSystemMemory(&size) )
	{
		printf("Failed: %d\n", GetLastError());
	}
	printf("Memory size: %lld\n", size);

	// Getting RAM Size using GlobalMemoryStatusEx
	MEMORYSTATUSEX statex;
  	statex.dwLength = sizeof (statex);

  	GlobalMemoryStatusEx (&statex);
  	printf ("Memory size: %lld\n", statex.ullTotalPhys/1024);
}
