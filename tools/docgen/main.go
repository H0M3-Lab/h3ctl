// SPDX-License-Identifier: AGPL-3.0-or-later

//go:build ignore

// docgen generates Markdown documentation for all h3ctl commands by walking
// the Cobra command tree. Output is written to docs/generated/.
//
// Usage:
//
//	go run tools/docgen/main.go
//	go run tools/docgen/main.go --out ./docs/generated
//
// CI drift check (fails if generated output differs from checked-in artifact):
//
//	go run tools/docgen/main.go && git diff --exit-code docs/generated/

package main

import (
	"flag"
	"fmt"
	"os"

	"github.com/h0m3-lab/h3ctl/internal/root"
	"github.com/spf13/cobra/doc"
)

func main() {
	outDir := flag.String("out", "docs/generated", "output directory for generated docs")
	flag.Parse()

	if err := os.MkdirAll(*outDir, 0o755); err != nil {
		fmt.Fprintf(os.Stderr, "failed to create output dir %q: %v\n", *outDir, err)
		os.Exit(1)
	}

	r := root.Build()

	// Disable timestamps so generated output is deterministic for CI diffing.
	r.DisableAutoGenTag = true

	if err := doc.GenMarkdownTree(r, *outDir); err != nil {
		fmt.Fprintf(os.Stderr, "doc generation failed: %v\n", err)
		os.Exit(1)
	}

	fmt.Printf("docs written to %s\n", *outDir)
}
