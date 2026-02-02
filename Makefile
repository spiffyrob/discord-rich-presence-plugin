.PHONY: test build package clean

PLUGIN_NAME := discord-rich-presence
WASM_FILE := plugin.wasm

test:
	go test -race ./...

build:
	tinygo build -target wasip1 -buildmode=c-shared -o $(WASM_FILE) -scheduler=none .

package: build
	zip $(PLUGIN_NAME).ndp $(WASM_FILE) manifest.json

clean:
	rm -f $(WASM_FILE) $(PLUGIN_NAME).ndp
