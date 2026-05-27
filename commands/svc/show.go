// SPDX-License-Identifier: AGPL-3.0-or-later

package svc

import (
	"errors"

	"github.com/spf13/cobra"
)

func newShowCmd(cluster *string, vm *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "show",
		Short: "Print the contents of the generated service file for a VM",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
