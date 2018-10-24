#exe=1 g
#charoem = 1
#include = K:\Gentee\Open Source\gentee\exe\lib\stdlib.ge
#libdir = K:\Gentee\Open Source\gentee\lib\vis
#silent = 1
#wait=0
#res = res\version.res
#icon = 101, K:\Gentee\Open Source\macroclip\images\default\main\mclip.ico
#output = K:\Gentee\Open Source\macroclip\mclip.exe
global
{
   str PROGDIR = "macroclip"
   str PROGNAME = "mclip"
   str REGKEY = "mclip"
   str CIC = ""
}

define
{
   UNICODE = 1
	DESIGNING = 0
   COMP = 0   
   PROGNAME = "MacroClip"
   PROGDIR = "mclip"
   SHORTNAME = "mc"
   VERSION = "3.1.0"
   NOPROTECT = 1
   CIAPP = 0
   KEYTIMEOUT = 500
}


import "hook.dll"
{
   hookstart( uint )
   hookstop(  )
   uint forceforeground( uint)
}



import "user32.dll"
{
   int  BroadcastSystemMessageW( uint, uint, uint, 
                                 uint, uint )-> BroadcastSystemMessage
   //uint ExitWindowsEx( uint, uint )
   uint RegisterWindowMessageW( uint ) -> RegisterWindowMessage
}

import "kernel32.dll"
{
   uint GetCommandLineW() -> GetCommandLineU
   uint CreateMutexA( uint, uint, uint ) -> CreateMutex
//   uint GetCurrentProcess()
   uint GetShortPathNameA( uint, uint, uint ) -> GetShortPathName 
}
include {
   $"..\gentee\lib\stdlibu\stdlibuext.g"   
   $"K:\Gentee\Open Source\gentee\lib\gt\gt.g"
   $"..\gentee-lib\app\uglobal.g"
   $"..\gentee-lib\dialogs\about.gf"
   $"..\gentee-lib\key\mclip.g"   
   $"..\gentee-lib\dialogs\trial.gf"
   $"..\gentee-lib\app\comp2gt.g"

}


global {
      
   str    stemp
   gt     prefs   
}

include {   
   $"clipman.gf"   
}

global {
   
}
func run<main>
{
   global_load( 0 )
      ustr ustemp = "Macroclip Neo"       
      uint gmsgid = RegisterWindowMessage( ustemp.ptr() )
      uint handle receipt = 0x8 //BSM_APPLICATIONS
      handle = CreateMutex( 0, 1, ustemp.ptr())
      if GetLastError() == 183// $ERROR_ALREADY_EXISTS
      {         
         //посылаем всем приложениям наше сообщение
         BroadcastSystemMessage( 0x00000080, // BSF_ALLOWSFW 
                          &receipt, gmsgid, 0, 0 )         
         ExitProcess( 0 )
      }

   str stemp
   App.Lng.load( getexepath( stemp, "language" ), "english", "english" )
   App.Lng.load( "english", "<default>
<progname=\"\$PROGNAME\" />
<version = \"Version: \$VERSION\" />
<urlwww= \"http://www.gentee.com/mclip/\" />
<urlsupport= \"http://www.gentee.com/mclip/\" />
<urlorder= \"http://www.gentee.com/mclip/\" />
<urlmail= \"macroclip@mail.ru\" />
<urlmailsend= \"mailto:macroclip@mail.ru?Subject=\$VERSION\" />
<caption = \"\$PROGNAME - [#prjname#]\" />
<copyright = \"Copyright © 2018 OOO Novostrim. All rights reserved.
This program was developed with Gentee Programming Language © 2004-2018 The Gentee Group. All rights reserved.\"/>
<copyexe = \"Copyright © #param#. All rights reserved.\"/>
</>")

   
   App.StyleM.AddStyle( "inverselabel",
"<style ver=1>
   <font size=+6 bold=0/>
   <text color=syscolor_5/>
   <brush color=syscolor_16/> 
</style>" )
   App.StyleM.AddStyle( "inversebold",
"<style ver=1>
   <font bold=1/>
   <text color=syscolor_5/>
   <brush color=syscolor_16/> 
</style>" )  
   App.StyleM.AddStyle( "bold",
"<style ver=1>
   <font bold=1/>
</style>" )  
   App.StyleM.AddStyle( "boldgrey",
"<style ver=1>
   <font bold=1/>
   <brush color=syscolor_16/>
</style>" )
   App.StyleM.AddStyle( "greytext",
"<style ver=1>
   <text color=syscolor_16/>   
</style>" )
   App.StyleM.AddStyle( "project",
"<style ver=1>
   <font bold=0 size=+4/>   
</style>" )
   App.StyleM.AddStyle( "white",
"<style ver=1>     
   <brush color=syscolor_5
</style>" )  

   
   str prefspath = getdatapath( stemp, "options.gt" )
   
   prefs.read( prefspath )

   App.ImgM.MainDir = getexepath( stemp, "images" )  
   App.ImgM.Load( "default", 1 )
      
   App.Load()
   
   uint ci as prefs.root().findrel( "preferences/language" )   
   if &ci 
   {  
      App.Lng.change( ci.value )
      App.Virtual( $mLangChanged )      
   }
   
      
   fClipMan.Owner = App   
   fClipMan.Visible = 0
   prefs.getform( sftools, fClipTools )
   fClipTools.Virtual( $mLangChanged )
   uint vis = prefs.getval( sftools, "Visible", 0 )
   
   fClipTools.Visible = vis
     
   App.Run()
   prefs.write( prefspath )
}
