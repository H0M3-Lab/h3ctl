// SPDX-License-Identifier: AGPL-3.0-or-later

package config

import (
	"errors"

	"github.com/spf13/cobra"
)

func newGetCmd(cluster *string, vm *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "get <field>",
		Short: "Get a single config field value, with override fallback",
		Args:  cobra.ExactArgs(1),
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
