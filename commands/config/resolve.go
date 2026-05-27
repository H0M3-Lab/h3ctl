// SPDX-License-Identifier: AGPL-3.0-or-later

package config

import (
	"errors"

	"github.com/spf13/cobra"
)

func newResolveCmd(cluster *string, vm *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "resolve",
		Short: "Show the fully merged effective config for a VM (requires --vm)",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
