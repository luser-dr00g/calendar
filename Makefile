year=`date +%Y`
#year=2020
#GS=gs
GS=gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite 

update:
	echo making pdfs for $(year)
	mkdir -p $(year)
	$(GS) -sOutputFile=$(year)/cal_6let_$(year).pdf \
	   -dmonth=1 -dyear=$(year) -dwide -doutline -sformat=6let -dpages=2 \
	   cal3.ps
	$(GS) -sOutputFile=$(year)/grid_planets_$(year).pdf \
	   -dyear=$(year) -dmpp=12 -dshowhours=false \
	   gridcal.ps
	$(GS) -sOutputFile=$(year)/grid_days_$(year).pdf \
	   -dyear=$(year) -dmpp=12 -dshowhours=false -duseplanets=false \
	   gridcal.ps
	$(GS) -sOutputFile=$(year)/grid_3pp_$(year).pdf \
	   -dyear=$(year) -dmpp=3 -dshowhours=true -duseplanets=true \
	   gridcal.ps

clean:
	rm -r $(year)
