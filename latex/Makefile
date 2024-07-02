FILENAME=main.tex
OUTPUT_DIRECTORY=build


setup:
	mkdir -p $(OUTPUT_DIRECTORY)

show:
	xpdf -rv -remote file $(OUTPUT_DIRECTORY)/main.pdf &
build:
	pdflatex -output-directory=$(OUTPUT_DIRECTORY) $(FILENAME)	

watch:
	while true;do inotifywait -e modify $(FILENAME);make all;xpdf -remote file -reload;done


.PHONY: all setup build watch

all: setup build

