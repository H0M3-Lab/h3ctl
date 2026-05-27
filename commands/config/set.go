// SPDX-License-Identifier: AGPL-3.0-or-later

package config

import (
	"errors"

	"github.com/spf13/cobra"
)

func newSetCmd(cluster *string, vm *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "set <key=value>...",
		Short: "Set one or more config fields (supports vms.<key>.<field> dot-path syntax)",
		Args:  cobra.MinimumNArgs(1),
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
