method vfClipMan vfClipMan.mLoad <alias=vfClipMan_mLoad>( )   
{   
//	this->vForm.mCreateWin()
	ustr empus
	str  emps
	ustr ustmp
	uint comp
	comp as this
		comp.AutoLang=1
		comp.Border=$fbrdSizeable
		comp.Bottom=0
		comp.Caption=empus
		comp.Enabled=1
		comp.FormStyle=$fsChild
		comp.Height=521
		comp.HelpTopic=empus
		comp.Hint=empus
		comp.HorzAlign=$alhLeft
		comp.IconName=empus
		comp.Left=0
		comp.Name="fClipMan"
		comp.Right=0
		comp.StartPos=$spDesigned
		comp.Style=emps
		comp.TabOrder=0
		comp.Tag=0
		comp.Top=0
		comp.TopMost=0
		comp.VertAlign=$alvTop
		comp.Visible=1
		comp.Width=610
		comp.WindowState=$wsNormal
		comp.OnPosChanged.Set( this, fClipMan_PosChanged )
		comp.OnCreate.Set( this, fClipMan_Create )
		comp.OnCloseQuery.Set( this, fClipMan_Close )
		comp.OnLanguage.Set( this, fClipMan_Lang )
		comp as this.Tray0
		comp.Owner = this
			comp.AutoLang=1
			comp.Caption=ustmp.fromutf8("progname")
			comp.Image=ustmp.fromutf8("main\\mclip")
			comp.Name="Tray0"
			comp.RBtnPopupMenu=.pmTray
			comp.Tag=0
			comp.Visible=1
			comp.OnMouse.Set( this, fClipMan_TrayMouse )
		comp as this.pmTray
		comp.Owner = this
			comp.AutoLang=1
			comp.Name="pmTray"
			comp.Tag=0
			comp as this.miTrayExit
			comp.Owner = this.pmTray
				comp.AutoCheck=0
				comp.AutoLang=1
				comp.Caption=ustmp.fromutf8("exit")
				comp.Checked=0
				comp.Ellipsis=0
				comp.Enabled=1
				comp.Image=empus
				comp.Name="miTrayExit"
				comp.RadioCheck=0
				comp.Separator=0
				comp.ShortKey=empus
				comp.Tag=0
				comp.Visible=1
				comp.OnClick.Set( this, fClipMan_Exit )
			comp as this.mPref
			comp.Owner = this.pmTray
				comp.AutoCheck=0
				comp.AutoLang=1
				comp.Caption=ustmp.fromutf8("preferences")
				comp.Checked=0
				comp.Ellipsis=1
				comp.Enabled=1
				comp.Image=empus
				comp.Name="mPref"
				comp.RadioCheck=0
				comp.Separator=0
				comp.ShortKey=empus
				comp.Tag=0
				comp.Visible=1
				comp.OnClick.Set( this, fClipMan_Settings )
			comp as this.mAbout
			comp.Owner = this.pmTray
				comp.AutoCheck=0
				comp.AutoLang=1
				comp.Caption=ustmp.fromutf8("about")
				comp.Checked=0
				comp.Ellipsis=1
				comp.Enabled=1
				comp.Image=empus
				comp.Name="mAbout"
				comp.RadioCheck=0
				comp.Separator=0
				comp.ShortKey=empus
				comp.Tag=0
				comp.Visible=1
				comp.OnClick.Set( this, fClipMan_About )
		comp as this.Menu0
		comp.Owner = this
			comp.AutoLang=1
			comp.Name="Menu0"
			comp.Tag=0
			comp as this.MenuItem0
			comp.Owner = this.Menu0
				comp.AutoCheck=0
				comp.AutoLang=1
				comp.Caption=ustmp.fromutf8("tools")
				comp.Checked=0
				comp.Ellipsis=0
				comp.Enabled=1
				comp.Image=empus
				comp.Name="MenuItem0"
				comp.RadioCheck=0
				comp.Separator=0
				comp.ShortKey=empus
				comp.Tag=0
				comp.Visible=1
				comp as this.MenuItem1
				comp.Owner = this.MenuItem0
					comp.AutoCheck=0
					comp.AutoLang=1
					comp.Caption=ustmp.fromutf8("settings")
					comp.Checked=0
					comp.Ellipsis=0
					comp.Enabled=1
					comp.Image=empus
					comp.Name="MenuItem1"
					comp.RadioCheck=0
					comp.Separator=0
					comp.ShortKey=empus
					comp.Tag=0
					comp.Visible=1
					comp.OnClick.Set( this, fClipMan_Settings )
	comp as this
		comp.ClientHeight=476
		comp.ClientWidth=592
		comp.Menu=.Menu0

	return this
}

method vfClipMan vfClipMan.init( )
{
   this.pTypeId = vfClipMan         
   return this
}
func init_vfClipMan <entry>()
{
   regcomp( vfClipMan, "vfClipMan", vForm, $vForm_last,
      %{ %{$mLoad,     vfClipMan_mLoad}},
      0->collection )
      
}
