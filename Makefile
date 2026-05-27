BIN      := h3ctl
OUT_DIR  := bin
DOCS_DIR := docs/generated

.PHONY: all build rebuild docs docs-check clean

all: build

build:
	go build -o $(OUT_DIR)/$(BIN) .

rebuild: clean build

docs:
	go run tools/docgen/main.go --out $(DOCS_DIR)

docs-check:
	go run tools/docgen/main.go --out $(DOCS_DIR) && git diff --exit-code $(DOCS_DIR)

clean:
	rm -rf $(OUT_DIR)
