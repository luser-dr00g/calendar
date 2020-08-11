year=`date +%Y`
#year=2021
#GS=gs
GS=gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite 
AT=@

update:
	$(AT) echo making pdfs for $(year) ...
	$(AT) mkdir -p $(year)
	$(AT) $(GS) -sOutputFile=$(year)/cal_6let_$(year).pdf \
	   -dmonth=1 -dyear=$(year) -dwide -doutline -sformat=6let -dpages=2 \
	   cal3.ps
	$(AT) $(GS) -sOutputFile=$(year)/grid_planets_$(year).pdf \
	   -dyear=$(year) -dmpp=12 -dshowhours=false \
	   gridcal.ps
	$(AT) $(GS) -sOutputFile=$(year)/grid_days_$(year).pdf \
	   -dyear=$(year) -dmpp=12 -dshowhours=false -duseplanets=false \
	   gridcal.ps
	$(AT) $(GS) -sOutputFile=$(year)/grid_3pp_$(year).pdf \
	   -dyear=$(year) -dmpp=3 -dshowhours=true -duseplanets=true \
	   gridcal.ps

clean:
	$(AT) rm -r $(year)
