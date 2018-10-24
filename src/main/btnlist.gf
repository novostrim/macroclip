/*	
 //!GFG � //!\GFG  are commentary attributes generated by 
 the Gentee form editor. You should neither delete them 
 nor make any changes into the source code from the beginning 
 of the commentary attribute //!GFG to its end //!\GFG
*/

//!GFG include
include {
	"app.g"
	"toolbar.g"
	"btn.g"
	"scrollbox.g"
//!\GFG   
}

 
//!GFG form
type vfBtnList <inherit=vForm> {
	vScrollBox	sbMain
	vToolBar	tbItems
	vToolBar	tbPaste
	vToolBar	tbCopy	
 //!\GFG   
   uint pPasteVisible
   uint pCopyVisible
   uint pMaxRows
   evEvent   OnPasteClick
   evEvent   OnItemClick
   evEvent   OnCopyClick
   uint on
}

property vfBtnList.MaxRows( uint newval )
{   
   if .pMaxRows != newval
   {
      .pMaxRows = newval
      if *.tbItems.Comps > .pMaxRows
      {         
         int i = *.tbItems.Comps - 1
         for i, i >= .pMaxRows, i--
         {
            .tbItems.Comps[i]->vToolBarItem.DestroyComp()
            .tbPaste.Comps[i]->vToolBarItem.DestroyComp()
            .tbCopy.Comps[i]->vToolBarItem.DestroyComp()
         }
      }
   }
}

method vfBtnList.DelItem( uint curitem )
{   
   if *.tbItems.Comps > curitem
   {  
      .tbItems.Comps[curitem]->vToolBarItem.DestroyComp()
      .tbPaste.Comps[curitem]->vToolBarItem.DestroyComp()
      .tbCopy.Comps[curitem]->vToolBarItem.DestroyComp()         
   }
   
}

method vfBtnList.iUpdateVis()
{
   uint left
   if .pCopyVisible
   {
      left = .tbCopy.Width
   }
   if .pPasteVisible
   {
      .tbPaste.Left = left
      left += .tbPaste.Width
   }
   .tbItems.Left = left
}

property uint vfBtnList.PasteVisible()
{
   return .pPasteVisible
}

property vfBtnList.PasteVisible( uint val )
{
   if val != .pPasteVisible
   {
      .pPasteVisible = val
      .tbPaste.Visible = 0      
      .iUpdateVis()
   }
}

property uint vfBtnList.CopyVisible()
{
   return .pCopyVisible
}

property vfBtnList.CopyVisible( uint val )
{
   if val != .pCopyVisible
   {
      .pCopyVisible = val
      .tbCopy.Visible = val      
      .iUpdateVis()      
   }
}

method uint vfBtnList.PasteClick <alias=vfBtnList_PasteClick>( evparEvent evn )//!\GFG
{     
   .OnPasteClick.Run( evn )
return 0
}

method uint vfBtnList.CopyClick <alias=vfBtnList_CopyClick>( evparEvent evn )//!\GFG
{  
   .OnCopyClick.Run( evn )
return 0
}

method uint vfBtnList.ItemClick <alias=vfBtnList_ItemClick>( evparEvent evn )//!\GFG
{   
   .OnItemClick.Run( evn )
return 0
}


method vfBtnList.AddClip( uint pcaption ) 
{   
   uint i
   ustr caption = pcaption->ustr
   uint item      
   if *.tbItems.Comps == .pMaxRows
   {
      item as .tbItems.Comps[*.tbItems.Comps-1]->vToolBarItem
      item.Caption = caption
      item.Index = 0
      
      .tbCopy.Comps[*.tbItems.Comps-1]->vToolBarItem.Index = 0
      .tbPaste.Comps[*.tbPaste.Comps-1]->vToolBarItem.Index = 0
   }
   else
   {
      item as .tbCopy.CreateComp( vToolBarItem )->vToolBarItem
      item.ImageId = "itemcopy".ustr()
      //item.Tag = idx 
      item.Index = 0
      item.OnClick.Set( this, vfBtnList_CopyClick )
      
      item as .tbPaste.CreateComp( vToolBarItem )->vToolBarItem
      item.ImageId = "itempaste".ustr()
      //item.Tag = idx
      item.Index = 0
      item.OnClick.Set( this, vfBtnList_PasteClick )
      
      item as .tbItems.CreateComp( vToolBarItem )->vToolBarItem
      item.AutoLang = 0
      item.Caption = caption
      item.ImageId = "itempaste".ustr()
      //item.Tag = idx      
      item.Index = 0
      item.OnClick.Set( this, vfBtnList_PasteClick )
      item.ShowCaption = 1
   }
   .tbItems.Height = *.tbItems.Comps * 22
   .tbCopy.Height = .tbItems.Height
   .tbPaste.Height = .tbItems.Height   
   //.tbItems.WinMsg( $TB_SETBUTTONSIZE, 0, 0x200FFF )
}


//!GFG method Create evparEvent
method uint vfBtnList.Create <alias=fBtnList_Create>( evparEvent evn )//!\GFG
{
   .pCopyVisible = 1
   .pPasteVisible = 1
   //.pMaxRows = 10
return 0
}


//!GFG method Mouse evparMouse
method uint vfBtnList.Mouse <alias=fBtnList_Mouse>( evparMouse evn )//!\GFG
{
   /*switch evn.evmtype 
   {
      
      case $evmMove
      {
         .on = 1
      print( "mouse move\n" )
      }
      case $evmLeave
      {
         .on = 0
      print( "mouse leave\n" )
      }
   }
   */
return 0
}

//!GFG method ItemMouse evparMouse
method uint vfBtnList.ItemMouse <alias=fBtnList_ItemMouse>( evparMouse evn )//!\GFG
{
/*
  switch evn.evmtype 
   {
      
      case $evmMove
      {
         .on = 1
      print( "itemmouse move\n" )
      }
      case $evmLeave
      {
         .on = 0
      print( "itemmouse leave\n" )
      }
   }*/
return 0
}

//!GFG includeinit
include { $"btnlist.gi" 
}//!\GFG

