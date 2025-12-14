.PHONY: all clean

RAW_TEXT = data/raw/text.txt
WORDCOUNT = data/processed/wordcount.csv
FIGURE = results/figures/wordcount.png

all: $(FIGURE)

$(RAW_TEXT):
	mkdir -p $(@D)
	echo "hello world hello make make make" > $@

$(WORDCOUNT): $(RAW_TEXT)
	mkdir -p $(@D)
	python scripts/wordcount.py --input_file $(RAW_TEXT) --output_file $@

$(FIGURE): $(WORDCOUNT)
	mkdir -p $(@D)
	python scripts/plotcount.py --input_file $(WORDCOUNT) --output_file $@

clean:
	rm -rf data/processed
	rm -rf results/figures
	rm -f data/raw/text.txt