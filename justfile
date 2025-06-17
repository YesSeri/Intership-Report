# Set main file and build dir
src := 'main.tex'
build_dir := 'build'
pdf := '{build_dir}/main.pdf'

all:
	pdflatex -output-directory={{build_dir}} {{src}}
	pdflatex -output-directory={{build_dir}} {{src}}
watch location:
	watchexec --exts tex -- 'just all ; cp build/main.pdf {{location}}'

clean:
	rm -rf {{build_dir}} && mkdir {{build_dir}}


