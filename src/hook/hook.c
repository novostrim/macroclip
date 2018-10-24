#include <windows.h>
#include <stdio.h>
#include "k:\gentee\open source\gentee\src\common\types.h"
#pragma data_seg(".Shared")
  
pvoid win = 0;

#pragma data_seg()
#pragma comment( linker, "-section:.Shared,rws")


pvoid  instdll;
pvoid  keyhook;
pvoid  keyllhook;
pvoid  mousehook;

#define dword DWORD
// для клавиатуры флаги одновременно нажатых клавиш
#define KEY_KEYALT      0x1000   // нажат Alt
#define KEY_KEYCTRL     0x2000   // нажат Ctrl
#define KEY_KEYSHIFT    0x4000   // нажат Shift
#define KEY_KEYUP       0x8000   // отжатие клавиши
#define KEY_WIN         0x10000   // команда для окна
#define KEY_PRE         0x20000   // команда для первичных обработчиков
#define KEY_KEYSTART    0x40000   // нажат Пуск

// функция для включения перехвата, par - идентификатор windows окна 
// которому будут посылаться перехваченные сообщения


// функция выключения перехвата
//void  WINAPI hookstop();                                                               

BOOL WINAPI _DllMainCRTStartup( HINSTANCE hinstDll, DWORD fdwReason,
                       LPVOID lpReserved )
{
   if ( fdwReason == DLL_PROCESS_ATTACH )
   {
      instdll = hinstDll;
   }
   return ( TRUE );
}

byte ar[256];
LRESULT CALLBACK keyboardllproc(  int code, unsigned int wpar, long lpar )  
{
int flg=0;
dword thisthread=0;
dword curthread = 0;
	if ( wpar == WM_KEYDOWN || wpar == WM_SYSKEYDOWN )
	{
		flg = 1;
	}
	/*if (((PKBDLLHOOKSTRUCT)lpar)->vkCode == 'Q')
	{
		 thisthread = GetCurrentThreadId();
                curthread = GetWindowThreadProcessId(GetForegroundWindow(),0);
               
               AttachThreadInput( thisthread, curthread, 1);              
               ActivateKeyboardLayout( 1, KLF_SETFORPROCESS );
               AttachThreadInput( thisthread, curthread, 0);
		
	}*/
	ar[((PKBDLLHOOKSTRUCT)lpar)->vkCode]=flg;
   if( SendMessage( win, 0x403/*WinUserKeyHook*/, ar, lpar ) )
      return 1;
   else
      return CallNextHookEx( keyhook, code, wpar, lpar );
}



LRESULT CALLBACK keyboardproc(  int code, unsigned int wpar, long lpar )  
{
/*   dword  par;

   par = wpar | ( lpar & 0x80000000 ? KEY_KEYUP : 0 ) |
                ( lpar & 0x20000000 ? KEY_KEYALT : 0 ) |
                ( GetKeyState( VK_SHIFT )<0 ? KEY_KEYSHIFT : 0 ) |
                ( GetKeyState( VK_CONTROL )<0 ? KEY_KEYCTRL : 0 );
  */ 

   dword  par;

   par = wpar | ( lpar & 0x80000000 ? KEY_KEYUP : 0 ) |
                ( lpar & 0x20000000 ? KEY_KEYALT : 0 ) |
                ( GetKeyState( VK_SHIFT )<0 ? KEY_KEYSHIFT : 0 ) |
                ( GetKeyState( VK_CONTROL )<0 ? KEY_KEYCTRL : 0 );
   
   if( SendMessage( win, 0x403/*WinUserKeyHook*/, par, lpar ) )
      return 1;
   else
      return CallNextHookEx( keyhook, code, wpar, lpar );
	
}

LRESULT CALLBACK mouseproc(  int code, unsigned int wpar, long lpar )  
{
	
	dword  par = 0;
	
	if (code < 0 )
	{
		return CallNextHookEx( mousehook, code, wpar, lpar );
	}
   

   switch ( wpar )
   {
   case WM_MOUSEMOVE:
	   par = ((PMOUSEHOOKSTRUCT)lpar)->hwnd;//WM_MOUSEMOVE;
		if( par && SendMessage( win, 0x402/*WinUserMouseHook*/, par, lpar ) )
			return 1;
		else
			return CallNextHookEx( mousehook, code, wpar, lpar );
	   break;

      case WM_LBUTTONUP:               
         par  = WM_LBUTTONUP;
         break;

      case WM_LBUTTONDOWN:
      case WM_NCLBUTTONDOWN:      
		  //MessageBeep(1);
         par  = WM_LBUTTONDOWN;         
         break;

/*		case WM_NCHITTEST:
		
		  //MessageBeep(1);
         par  = WM_NCHITTEST;         
         break;*/

      case WM_RBUTTONUP:              
         par  = WM_RBUTTONUP;
         break;

      case WM_RBUTTONDOWN:
      case WM_NCRBUTTONDOWN:         
         par  = WM_RBUTTONDOWN;
         break;

      case WM_LBUTTONDBLCLK:           
         //SendMessage( hwnd, WM_LBUTTONDOWN, wpar, lpar );                  
         par  = WM_LBUTTONDBLCLK;         
         break;

      case WM_RBUTTONDBLCLK:         
         par  = WM_RBUTTONDBLCLK;
         break;
	  case WM_MOUSEWHEEL:
		  //par = ((PMOUSEHOOKSTRUCT)lpar)->hwnd;//WM_MOUSEMOVE;
	//	  SendMessage( win, 0x405/*WinUserMouseHook*/, wpar, lpar);
	
		  par= WM_MOUSEWHEEL;
		  break;
   }   
		if( par && SendMessage( win, 0x404/*WinUserMouseHook*/, par, lpar ) )
			return 1;
		else
			return CallNextHookEx( mousehook, code, wpar, lpar );   

}

LRESULT CALLBACK mousellproc(  int code, unsigned int wpar, long lpar )  
{
	
	dword  par = 0;
	
	if (code < 0 )
	{
		return CallNextHookEx( mousehook, code, wpar, lpar );
	}   

   switch ( wpar )
   {		
	  case WM_MOUSEWHEEL:
		  //par = ((PMOUSEHOOKSTRUCT)lpar)->hwnd;//WM_MOUSEMOVE;
		  //if (SendMessage( win, 0x405/*WinUserMouseHook*/, wpar, lpar))
		//	return 1;
	
		  break;
   }   
   if (SendMessage( win, 0x405/*WinUserMouseHook*/, wpar, lpar))
			return 1;
   return CallNextHookEx( mousehook, code, wpar, lpar );   

}


void __declspec( dllexport )  hookstart( pvoid par )
{ 
   win = par;
   //keyhook = SetWindowsHookEx( WH_KEYBOARD, keyboardproc, instdll, 0 );  
   keyllhook = SetWindowsHookEx( WH_KEYBOARD_LL, keyboardllproc, instdll, 0 );  
   mousehook = SetWindowsHookEx( WH_MOUSE, mouseproc, instdll, 0 );  
   mousehook = SetWindowsHookEx( WH_MOUSE_LL, mousellproc, instdll, 0 );  
//   if (mousehook > 0)
//		MessageBeep(0);	
   //else
	 //  MessageBeep(1);
}

void __declspec( dllexport )  hookstop()
{ 
   //UnhookWindowsHookEx( keyhook );
   UnhookWindowsHookEx( mousehook );
}

BOOL __declspec( dllexport ) forceforeground( HWND hwnd )
{ 
   uint self;
   uint foreground = GetWindowThreadProcessId( GetForegroundWindow(), 0 );
   BOOL result;

   if ( !hwnd || !IsWindow(hwnd)) 
      return 0;

   self = GetWindowThreadProcessId( hwnd, 0 );
   if( foreground != self )
   {
//      AttachThreadInput( foreground, self, TRUE );
      AttachThreadInput( self, foreground, TRUE );
      result = SetForegroundWindow( hwnd );
      AttachThreadInput( self, foreground, FALSE );
//      AttachThreadInput( foreground, self, FALSE );
   }
   else
      result = SetForegroundWindow( hwnd );
   if ( IsIconic( hwnd ))
      ShowWindow( hwnd, SW_RESTORE );
   else 
      ShowWindow( hwnd, SW_SHOW );
   return result != 0;
}
