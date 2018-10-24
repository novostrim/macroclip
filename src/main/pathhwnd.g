define {
   TH32CS_SNAPPROCESS = 0x02
   TH32CS_SNAPMODULE  = 0x08
   MAX_PATH = 500
   MAX_MODULE_NAME32 = 255
}

type PROCESSENTRY32
{
uint dwSize 
uint cntUsage 
uint th32ProcessID 
uint th32DefaultHeapID 
uint th32ModuleID 
uint cntThreads 
uint th32ParentProcessID 
uint pcPriClassBase 
uint dwflags 
reserved szexeFile[$MAX_PATH]
}

type MODULEENTRY32 
{  
   uint dwSize
   uint th32ModuleID
   uint th32ProcessID
   uint GlblcntUsage
   uint ProccntUsage
   uint modBaseAddr
   uint modBaseSize
   uint hModule
   reserved szModule[$MAX_MODULE_NAME32 + 1];  
   reserved szExePath[$MAX_PATH];
}

import "user32"
{
   uint GetWindowThreadProcessId( uint, uint ) 
}

import "kernel32"
{
uint CreateToolhelp32Snapshot( uint, uint )
uint Module32First( uint, MODULEENTRY32 )
uint Module32Next( uint, MODULEENTRY32 )
uint Process32First( uint, PROCESSENTRY32 ) 
uint Process32Next( uint, PROCESSENTRY32 ) 
CloseHandle( uint )
}

func uint GetPathFromHWND( uint hwnd, str path )
{
   uint threadID, processID, hSnapshot, rProcessFound 
   PROCESSENTRY32 pe32 
   uint i, res
   
   path.clear()
   
   threadID = GetWindowThreadProcessId( hwnd, &processID )
   
   if threadID && processID
   { 
      hSnapshot = CreateToolhelp32Snapshot($TH32CS_SNAPPROCESS, 0)
      if hSnapshot != -1 
      {
         pe32.dwSize = sizeof(PROCESSENTRY32)
         rProcessFound = Process32First( hSnapshot, pe32 )
         while rProcessFound
         {
            if pe32.th32ProcessID == processID
            {  
               MODULEENTRY32 me32
               uint hModuleSnap = CreateToolhelp32Snapshot( $TH32CS_SNAPMODULE, processID )
               if hModuleSnap != -1  
               {                  
                  me32.dwSize = sizeof( MODULEENTRY32 )      
                  uint rModuleFound = Module32First( hModuleSnap, me32 )
                  if rModuleFound 
                  {
                     path.copy(&me32.szExePath)
                     res = 1
                  }
                  CloseHandle( hModuleSnap )
               }           
               break
            }              
            rProcessFound = Process32Next(hSnapshot, pe32)            
         }
         CloseHandle(hSnapshot)
      }   
   }
   return res
}
