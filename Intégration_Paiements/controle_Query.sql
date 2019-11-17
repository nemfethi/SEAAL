select CngAno.*, cnglgncss.Idtclt, MntPmt, DatRgl, cngctrl.Lib 
from cngano, CngCtrl, cnglgncss 
where CngAno.idtcss='DC_001' 
and CngAno.idtcng=15
and cngano.Idtctrl = cngctrl.idtctrl
and CngAno.IdtCss = cnglgncss.idtCss
and CngAno.IdtCng = cnglgncss.idtCng
and CngLgnCss.IdtLgnCssCng = Cngano.IdtLgnCssCng;