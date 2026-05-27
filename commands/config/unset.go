// SPDX-License-Identifier: AGPL-3.0-or-later

package config

import (
	"errors"

	"github.com/spf13/cobra"
)

func newUnsetCmd(cluster *string, vm *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "unset <field>...",
		Short: "Remove one or more config overrides, restoring the parent-level default",
		Args:  cobra.MinimumNArgs(1),
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
