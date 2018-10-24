#!gentee.exe -s -p vis "%1"
define
{
	DESIGNING = 0
   COMP = 0   
}
include {   
   $"histitem.gf"
   //$"histitem.gi"
}
global {
   vfHistItem fHistItem
}

func run<main>
{
   App.Load()
   fHistItem.Owner = App   
   App.Run()
}
