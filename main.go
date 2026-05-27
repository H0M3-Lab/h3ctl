// SPDX-License-Identifier: AGPL-3.0-or-later

package main

import (
	"os"

	"github.com/h0m3-lab/h3ctl/internal/root"
)

func main() {
	if err := root.Build().Execute(); err != nil {
		os.Exit(1)
	}
}

