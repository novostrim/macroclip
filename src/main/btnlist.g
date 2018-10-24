#!gentee.exe -s -p vis "%1"
define
{
	DESIGNING = 0
   COMP = 0   
}
include {   
   $"btnlist.gf"
   //$"btnlist.gi"
}
global {
   vfBtnList fBtnList
}

func run<main>
{
   App.Load()
   fBtnList.Owner = App   
   App.Run()
}
