method vfHistItem vfHistItem.mLoad <alias=vfHistItem_mLoad>( )   
{   
//	this->vForm.mCreateWin()
	ustr ustmp
	uint comp
	comp as this
	with comp
	{
		.AutoLang=1
		.Border=$fbrdSizeable
		.Bottom=0
		.Caption=ustmp.fromutf8("")
		.Enabled=1
		.FormStyle=$fsPopup
		.Height=429
		.HelpTopic=ustmp.fromutf8("")
		.Hint=ustmp.fromutf8("")
		.HorzAlign=$alhLeft
		.IconName=ustmp.fromutf8("")
		.Left=0
		.Name="fHistItem"
		.Right=0
		.StartPos=$spScreenCenter
		.Style=""
		.TabOrder=0
		.Tag=0
		.Top=0
		.TopMost=0
		.VertAlign=$alvTop
		.Visible=0
		.Width=608
		.WindowState=$wsNormal
		.OnCreate.Set( this, fHistItem_Create )

		uint comp
		comp as this.Splitter0
		comp.Owner = this
		with comp
		{
			.AutoLang=1
			.AutoSize=1
			.Bottom=0
			.Enabled=1
			.FixedPart=$sfpRight
			.Height=400
			.HelpTopic=ustmp.fromutf8("")
			.Hint=ustmp.fromutf8("")
			.HorzAlign=$alhClient
			.Left=0
			.LeftMinSize=0
			.Name="Splitter0"
			.Orientation=$soHorizontal
			.Right=0
			.RightMinSize=0
			.SplitterWidth=0
			.Style=""
			.TabOrder=0
			.Tag=0
			.Top=0
			.VertAlign=$alvClient
			.Visible=1
			.Width=600

			uint comp
			comp as this.Panel0
			comp.Owner = this.Splitter0
			with comp
			{
				.AutoLang=1
				.Border=$brdNone
				.Bottom=0
				.Caption=ustmp.fromutf8("")
				.Enabled=1
				.Height=350
				.HelpTopic=ustmp.fromutf8("")
				.Hint=ustmp.fromutf8("")
				.HorzAlign=$alhLeft
				.Left=0
				.Name="Panel0"
				.Right=0
				.Style=""
				.TabOrder=0
				.Tag=0
				.Top=0
				.VertAlign=$alvTop
				.Visible=1
				.Width=600

				uint comp
				comp as this.pTop
				comp.Owner = this.Panel0
				with comp
				{
					.AutoLang=1
					.Border=$brdNone
					.Bottom=65
					.Caption=ustmp.fromutf8("")
					.Enabled=1
					.Height=285
					.HelpTopic=ustmp.fromutf8("")
					.Hint=ustmp.fromutf8("")
					.HorzAlign=$alhClient
					.Left=0
					.Name="pTop"
					.Right=0
					.Style=""
					.TabOrder=0
					.Tag=0
					.Top=0
					.VertAlign=$alvTopBottom
					.Visible=1
					.Width=600
				}
				comp as this.e_wincaption
				comp.Owner = this.Panel0
				with comp
				{
					.AddColon=1
					.AutoLang=1
					.Bottom=38
					.Btn1Hint=ustmp.fromutf8("")
					.Btn1Image=ustmp.fromutf8("")
					.Btn2Hint=ustmp.fromutf8("")
					.Btn2Image=ustmp.fromutf8("")
					.Caption=ustmp.fromutf8("wincaption")
					.Enabled=1
					.Height=25
					.HelpTopic=ustmp.fromutf8("")
					.Hint=ustmp.fromutf8("")
					.HorzAlign=$alhLeftRight
					.LabelPos=$lpLeft
					.Left=160
					.LEStyle=$lsSimple
					.MaxLen=32768
					.Multiline=0
					.Name="e_wincaption"
					.Password=0
					.ReadOnly=1
					.Right=10
					.ScrollBars=0
					.Style=""
					.TabOrder=1
					.Tag=33
					.Text=ustmp.fromutf8("")
					.Top=287
					.VertAlign=$alvBottom
					.Visible=1
					.Width=430

					uint comp
				}
				comp as this.e_fileexe
				comp.Owner = this.Panel0
				with comp
				{
					.AddColon=1
					.AutoLang=1
					.Bottom=8
					.Btn1Hint=ustmp.fromutf8("")
					.Btn1Image=ustmp.fromutf8("")
					.Btn2Hint=ustmp.fromutf8("")
					.Btn2Image=ustmp.fromutf8("")
					.Caption=ustmp.fromutf8("fileexe")
					.Enabled=1
					.Height=25
					.HelpTopic=ustmp.fromutf8("")
					.Hint=ustmp.fromutf8("")
					.HorzAlign=$alhLeftRight
					.LabelPos=$lpLeft
					.Left=160
					.LEStyle=$lsSimple
					.MaxLen=32768
					.Multiline=0
					.Name="e_fileexe"
					.Password=0
					.ReadOnly=1
					.Right=10
					.ScrollBars=0
					.Style=""
					.TabOrder=3
					.Tag=33
					.Text=ustmp.fromutf8("")
					.Top=317
					.VertAlign=$alvBottom
					.Visible=1
					.Width=430

					uint comp
				}
			}
			comp as this.DlgBtns0
			comp.Owner = this.Splitter0
			with comp
			{
				.AutoLang=1
				.Border=$brdNone
				.Bottom=0
				.Caption=ustmp.fromutf8("")
				.CurWizard=0
				.CustomCaption=ustmp.fromutf8("")
				.DisableNext=0
				.Enabled=1
				.Height=50
				.HelpTopic=ustmp.fromutf8("")
				.Hint=ustmp.fromutf8("")
				.HorzAlign=$alhLeft
				.Indent=15
				.Left=0
				.MaxWizard=0
				.Name="DlgBtns0"
				.Right=0
				.ShowApply=1
				.ShowCancel=0
				.ShowClose=1
				.ShowCustom=0
				.ShowDone=$dsdNone
				.ShowHelp=1
				.ShowLine=1
				.Style=""
				.TabOrder=1
				.Tag=0
				.Top=350
				.VertAlign=$alvTop
				.Visible=1
				.Width=600
				.Wizard=1

				uint comp
			}
			.Distance=350
		}
		.ClientHeight=400
		.ClientWidth=600
	}

	return this
}

method vfHistItem vfHistItem.init( )
{
   this.pTypeId = vfHistItem         
   return this
}
func init_vfHistItem <entry>()
{
   regcomp( vfHistItem, "vfHistItem", vForm, $vForm_last,
      %{ %{$mLoad,     vfHistItem_mLoad}},
      0->collection )
      
}
