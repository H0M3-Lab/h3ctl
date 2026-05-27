// SPDX-License-Identifier: AGPL-3.0-or-later

package talos

import (
	"errors"

	"github.com/spf13/cobra"
)

func newApplyConfigCmd(cluster *string, vm *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "apply-config",
		Short: "Apply Talos machine config to a VM in maintenance mode",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
