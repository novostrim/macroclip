/*	
 //!GFG � //!\GFG  are commentary attributes generated by 
 the Gentee form editor. You should neither delete them 
 nor make any changes into the source code from the beginning 
 of the commentary attribute //!GFG to its end //!\GFG
*/

//!GFG include
include {
	"app.g"
	"timer.g"
	"popupmenu.g"
	"toolbar.g"
	"tray.g"
	"btn.g"
	"tab.g"
//!\GFG
   "pathhwnd.g"   
}

func test( str out ) 
{
/*   str x
   str t = "test.txt"
   x.read( t )
   x += "\n" + out
   x.write( t )*/   
}


type KEYBDINPUT 
{
   ushort    wVk
   ushort    wScan
   uint      dwFlags
   uint      time
   uint      dwExtraInfo
}

type MOUSEINPUT 
{
   int    dx
   int    dy
   uint   mouseData
   uint   dwFlags
   uint   time
   uint   dwExtraInfo
}


type INPUT {
   uint        typei
   MOUSEINPUT  mi
}
 
define <export>
{
   INPUT_MOUSE     = 0
   INPUT_KEYBOARD  = 1 
   INPUT_HARDWARE  = 2
   
   KEYEVENTF_EXTENDEDKEY = 0x0001
   KEYEVENTF_KEYUP       = 0x0002
   KEYEVENTF_UNICODE     = 0x0004
   KEYEVENTF_SCANCODE    = 0x0008
   
} 
import "user32.dll" {   
   uint   SendInput( uint, uint, uint )
}

func keyemul( uint key, uint mstate )
{
   arr ain of INPUT
   subfunc addkey( uint vk )
   {
      uint cur = *ain/2
      ain.insert( cur, 2 )
      uint i
      fornum i=0, 2
      {           
         ain[ cur ].typei = $INPUT_KEYBOARD
         ain[ cur ].mi->KEYBDINPUT.wVk = vk
         ain[ cur ].mi->KEYBDINPUT.dwFlags = ?( i, $KEYEVENTF_KEYUP, 0 )
         ain[ cur ].mi->KEYBDINPUT.time = 200
         cur++ 
      }
   }
   if mstate & $mstShift : addkey( $VK_SHIFT )
   if mstate & $mstCtrl : addkey( $VK_CONTROL )
   if mstate & $mstAlt : addkey( $VK_MENU )
   if mstate & $mstWin : addkey( $VK_LWIN )
   addkey( key )  
   SendInput( *ain, ain.ptr(), sizeof( INPUT ) )   
}
 
//!GFG form
type vfClipTools <inherit=vForm> {
	vTab	Tab0
	vTabItem	tiHistory
	vTabItem	tiFast
	vTabItem	tiNotice
	vTabItem	tiSpeed
	vToolBar	ToolBar0
	vToolBarItem	tbiMainWin
	vToolBarItem	ToolBarItem0	
	vTray	Tray0
	vPopupMenu	pmTray
	vMenuItem	miExit
	vTimer	timerRestore
	vPopupMenu	pmBtns
	vMenuItem	miCopyToNotices
	vMenuItem	miDelete
	vMenuItem	MenuItem0
 //!\GFG
   uint        flgNoCopy 
   uint        flgProtect
   uint        nextwnd
   vfBtnList   blHistory
   uint        CurTBItem
   uint        LastTBItem
   uint        MouseOn
}

method vfClipTools.CheckPos()
{
   if .Visible
   {      
      RECT r
      uint z=GetWindowRect( GetDesktopWindow(), r )
      if .Left > r.right - 30
      {
         .Left = r.right - .Width
      }
      elif .Left < 0
      {
         .Left = 0
      }
      if .Top > r.bottom - 30
      {
         .Top = r.bottom - .Height
      }
      elif .Top < 0
      {
         .Top = 0
      }
   }
   else
   {
      
   }
}

//��������/������ ������� ����
method vfClipTools.HideShow( uint show )
{  
   if show
   {      
      if .WindowState == $wsMinimized :  .WindowState = $wsNormal
      //forceforeground( this.hwnd )
   }
   .Visible = show      
}

//!GFG method Tray evparMouse
method uint vfClipTools.Tray <alias=fClipTools_Tray>( evparMouse evn )//!\GFG
{
   if evn.evmtype == $evmLDown
   {
      .HideShow( !.Visible )      
   }
return 0
}

global { 
uint x, y
arrstr  stdformats = %{"","TEXT","BITMAP","METAFILEPICT","SYLK","DIF ","TIFF","OEMTEXT",
"DIB ","PALETTE","PENDATA","RIFF","WAVE","UNICODETEXT","ENHMETAFILE","HDROP",
"LOCALE","MAX " }
 }

import "kernel32.dll" {
   uint GlobalSize( uint )
}

import "user32.dll" {
uint GetWindowLongPtr( uint, uint ) //-> GetWindowLongPtr

   uint ChangeClipboardChain( uint, uint )
   uint CloseClipboard()
   int CountClipboardFormats()
   uint EnumClipboardFormats( uint )
   uint EmptyClipboard()
   uint GetClipboardData( uint )
   uint GetClipboardOwner()
   uint OpenClipboard( uint )
   uint SetClipboardViewer( uint )
   uint RegisterClipboardFormatW( uint ) -> RegisterClipboardFormat
   int GetClipboardFormatNameW( uint, uint, int ) -> GetClipboardFormatName
   uint SetClipboardData( uint, uint )   
}

define {
WM_DRAWCLIPBOARD     = 0x0308
//WM_PAINTCLIPBOARD    = 0x0309
//WM_VSCROLLCLIPBOARD  = 0x030A
//WM_SIZECLIPBOARD     = 0x030B
//WM_ASKCBFORMATNAME   = 0x030C
WM_CHANGECBCHAIN     = 0x030D


CF_TEXT             = 1     
CF_BITMAP           = 2     
CF_METAFILEPICT     = 3     
CF_SYLK             = 4     
CF_DIF              = 5     
CF_TIFF             = 6     
CF_OEMTEXT          = 7     
CF_DIB              = 8     
CF_PALETTE          = 9     
CF_PENDATA          = 10    
CF_RIFF             = 11    
CF_WAVE             = 12    
CF_UNICODETEXT      = 13    
CF_ENHMETAFILE      = 14
CF_HDROP            = 15    
CF_LOCALE           = 16    
CF_MAX              = 17
                          
CF_OWNERDISPLAY     = 0x0080
CF_DSPTEXT          = 0x0081
CF_DSPBITMAP        = 0x0082
CF_DSPMETAFILEPICT  = 0x0083
CF_DSPENHMETAFILE   = 0x008E

CF_CUSTOM = 0x1000
CF_HTML   = 0x1100
CF_RTF    = 0x1200

}

extern
{
method vfClipTools.LoadHistory( uint id )
}

type DROPFILES {
    uint pFiles
    POINT pt
    uint fNC
    uint fWide
} 

define {
   MF_TEXT = 1
   MF_HTML = 2
   MF_RTF = 3
   MF_BITMAP = 4
   MF_FILES = 5
   
}

global { 
   uint htmlid
   uint rtfid
   vfClipTools fClipTools   
}



method uint vfClipTools.SetClipboard( uint idx )
{
   if !OpenClipboard(.hwnd) : return 0
   test( "SetClipboard" )
   .flgNoCopy = 1
   EmptyClipboard()

   uint s as .blHistory.tbItems.Comps[idx]->vToolBarItem.Caption
   uint hglb = GlobalAlloc( $GMEM_MOVEABLE, *(s->buf) )
   uint mem = GlobalLock(hglb)
   mcopy(mem, s->buf.ptr(), *(s->buf) )                            
   GlobalUnlock(hglb)
   
   SetClipboardData( $CF_UNICODETEXT, hglb )   
   CloseClipboard()
   
   return 0
}

//!GFG method Restore evparEvent
method uint vfClipTools.Restore <alias=fClipTools_Restore>( evparEvent evn )//!\GFG
{
   
return 0
}

//!GFG method PasteClick evparEvent
method uint vfClipTools.PasteClick <alias=fClipTools_PasteClick>( evparEvent evn )//!\GFG
{ 
   
   .SetClipboard( evn.sender->vToolBarItem.Index )   
   //keyemul( 'V', $mstCtrl )
   keyemul( $VK_INSERT, $mstShift )
     
return 0
}


//!GFG method CopyClick evparEvent
method uint vfClipTools.CopyClick <alias=fClipTools_CopyClick>( evparEvent evn )//!\GFG
{  
   
return 0
}

//!GFG method PasteClick evparEvent
method uint vfClipTools.ItemClick <alias=fClipTools_ItemClick>( evparEvent evn )//!\GFG
{  
   fClipMan.EditItem( this, .Tab0.CurIndex, evn.sender->vToolBarItem.Tag, evn.sender->vToolBarItem )   
return 0
}

method uint vfClipTools.Draw <alias=fClipTools_Draw>( winmsg wmsg )
{  
   test( "Draw011 \(.flgNoCopy)\n" )
   if .flgNoCopy 
   {
      .flgNoCopy = 0
      return 0
   }
   test( "Draw02 \(.flgProtect)\n" )
   if .flgProtect : return 0
   .flgProtect = 1
   uint format, formatid
   uint hwnd = GetForegroundWindow()//GetClipboardOwner()
   ustr name
   name.reserve( 500 )
   name.setlen( 500 )
   test( "Draw1" )
   str n
   GetPathFromHWND( hwnd, n)
   name.setlen( SendMessage( hwnd, $WM_GETTEXT, *name, name.ptr() ) )
   
   uint errorcnt 
   while errorcnt<10
   {
      if OpenClipboard( .hwnd )
      {
         test( "Draw2" )        
         uint cnt
         ustr uval
         while format = EnumClipboardFormats( format )
         {   
            test( "Draw3 \(format)" )
   /*      
   CF_TEXT             = 1 
   CF_BITMAP           = 2       
   CF_METAFILEPICT     = 3             
   CF_SYLK             = 4                   
   CF_DIF              = 5                         
   CF_TIFF             = 6                               
   CF_OEMTEXT          = 7                                     
   CF_DIB              = 8                                           
   CF_PALETTE          = 9                                                 
   CF_PENDATA          = 10                                                      
   CF_RIFF             = 11                                                            
   CF_WAVE             = 12                                                                  
   CF_UNICODETEXT      = 13                                                                        
   CF_ENHMETAFILE      = 14                                                                              
   CF_HDROP            = 15                                                                                    
   CF_LOCALE           = 16                                                                                          
   CF_MAX              = 17                                                                                                
   */                                                                                                            
            if format >= 18 &&
               format != $CF_TEXT &&
               format != $CF_OEMTEXT &&
               format != $CF_UNICODETEXT  : continue;    
            test( "Draw4\n")                    
            if format < 18 
            {
               name = stdformats[format].ustr()
               formatid = format      
            }   
            
           
            switch format
            {  
               case $CF_UNICODETEXT
               {
                  test( "Draw5\n")
                  uint hglb = GetClipboardData(format)
                  test( "Draw6\n")                                      
                  if hglb
                  {     
                  test( "Draw7\n")
                  buf  data
                  uint size = GlobalSize( hglb )
                  test( "Draw8 \(size)\n")
                  uint lk = GlobalLock(hglb)
                  test( "Draw9 \(lk)\n")
                  uval.copy( lk, size/2 )
                  test( "Draw10\n")
                  GlobalUnlock(hglb)
                  }                     
                  test( "Draw11\n")
                  //uval.copy( data.ptr() )
                  break
                  //caption.substr( uval, 0, min( 255, *uval ) )
               }
               
            }
            cnt++
              
         }
         test( "Draw close" )
         CloseClipboard()
         //if !.CopyItem
         {
            SendMessage( .nextwnd, $WM_DRAWCLIPBOARD, wmsg.wpar, wmsg.lpar )
         }
         .blHistory.AddClip(&uval)
         
   
         break;
      }
      else
      {
         //print( "ERROR \(GetLastError())\n")
         errorcnt++
         sleep(10)
         test( "Draw err" )
      }
   }
   test( "Draw100" )
   .flgProtect = 0
   return 0   
}


method uint vfClipTools.Change <alias=fClipTools_Change>( winmsg wmsg )
{  
   test( "Change" )   
   if ( .nextwnd == wmsg.wpar ) : .nextwnd = wmsg.lpar
   else
   {
      SendMessage( .nextwnd, $WM_CHANGECBCHAIN, wmsg.wpar, wmsg.lpar ) 
   }          
   return 0
}


//!GFG method fm evparMouse
method uint vfClipTools.fm <alias=fClipTools_fm>( evparMouse evn )//!\GFG
{
   switch evn.evmtype 
   {
      case $evmLDown
      {
       
      }
      case $evmLUp
      {
       
      }
      case $evmMove
      {
      }
      case $evmLeave
      {
      }
      case $evmActivate
      {      
         evn.ret = 3//$MA_NOACTIVATE
         return 1
      } 
   }   
return 0
}
      
method vfClipTools.SetMaxRows( uint newval )
{
   .blHistory.MaxRows = newval 
}

//!GFG method Create evparEvent
method uint vfClipTools.Create <alias=fClipTools_Create>( evparEvent evn )//!\GFG
{                    
   .Caption = "\("progname".ustr()->locustr.Text(this).str()) ".ustr()

   this.pTypeDef->tTypeDef.setproc( $WM_DRAWCLIPBOARD, fClipTools_Draw )
   this.pTypeDef->tTypeDef.setproc( $WM_CHANGECBCHAIN, fClipTools_Change )

   .blHistory.Owner = .tiHistory
   .blHistory.CopyVisible = 0
   .blHistory.PasteVisible = 0
   
   .blHistory.OnPasteClick.Set( this, fClipTools_PasteClick )
   .blHistory.OnItemClick.Set( this, fClipTools_ItemClick )
   .blHistory.tbItems.PopupMenu = .pmBtns
   
   .LoadHistory(0)
   
   htmlid = RegisterClipboardFormat("HTML Format".ustr().ptr())
   rtfid = RegisterClipboardFormat("Rich Text Format".ustr().ptr())
   .nextwnd = SetClipboardViewer( this.hwnd )   
return 0
}

//!GFG method Destroy evparEvent
method uint vfClipTools.Destroy <alias=fClipTools_Destroy>( evparEvent evn )//!\GFG
{
   ChangeClipboardChain( this.hwnd, .nextwnd )
return 0
}


//!GFG method Exit evparEvent
method uint vfClipTools.Exit <alias=fClipTools_Exit>( evparEvent evn )//!\GFG
{
   fClipMan.flgExit = 1
   fClipMan.Close()
   fClipMan.flgExit = 0
return 0
}

//!GFG method Close evparQuery
method uint vfClipTools.Close <alias=fClipTools_Close>( evparQuery evn )//!\GFG
{
   if !fClipMan.flgExit 
   {
      evn.flgCancel = 1
      .Visible = 0
   } 
return 0
}

define {
MA_ACTIVATE         = 1
MA_ACTIVATEANDEAT   = 2
MA_NOACTIVATE       = 3
MA_NOACTIVATEANDEAT = 4
}


//!GFG method click evparEvent
method uint vfClipTools.CopyTo <alias=fClipTools_CopyTo>( evparEvent evn )//!\GFG
{
   
return 0
}


//!GFG method PopupBtns evparQuery
method uint vfClipTools.PopupBtns <alias=fClipTools_PopupBtns>( evparQuery evn )//!\GFG
{   
   POINT p
   GetCursorPos( p )
   ScreenToClient( .blHistory.tbItems.hwnd, p )
   int idx = .blHistory.tbItems.WinMsg( $TB_HITTEST, 0, &p ) 
   if idx >= 0
   {   
      .CurTBItem = .blHistory.tbItems.Comps[idx]
      .LastTBItem = .CurTBItem
      .CurTBItem->vToolBarItem.TBIStyle = $tbsAsCheckBox
      .CurTBItem->vToolBarItem.Checked = 1
   }
   else
   {
      evn.flgCancel = 1
      .CurTBItem = 0      
   }
return 0
}


//!GFG method PopupClose evparEvent
method uint vfClipTools.PopupClose <alias=fClipTools_PopupClose>( evparEvent evn )//!\GFG
{   
   if .CurTBItem
   {    
      .CurTBItem->vToolBarItem.TBIStyle = $tbsButton
      .CurTBItem = 0
   }     
return 0
}

//!GFG method DeleteItem evparEvent
method uint vfClipTools.DeleteItem <alias=fClipTools_DeleteItem>( evparEvent evn )//!\GFG
{   
   if .LastTBItem 
   {
      .blHistory.DelItem( .LastTBItem->vToolBarItem.Index/*curindex*/ )
      .CurTBItem = 0
      .LastTBItem = 0
   }
return 0
}

//!GFG method EditItem evparEvent
method uint vfClipTools.EditItem <alias=fClipTools_EditItem>( evparEvent evn )//!\GFG
{
   
return 0
}


//!GFG method MainWin evparEvent
method uint vfClipTools.MainWin <alias=fClipTools_MainWin>( evparEvent evn )//!\GFG
{
   fClipMan.HideShow( !fClipMan.Visible )
return 0
}

//!GFG includeinit
include { $"cliptools.gi" 
}//!\GFG

