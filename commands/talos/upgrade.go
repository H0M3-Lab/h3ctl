// SPDX-License-Identifier: AGPL-3.0-or-later

package talos

import (
	"errors"

	"github.com/spf13/cobra"
)

func newUpgradeCmd(cluster *string, vm *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "upgrade",
		Short: "Upgrade Talos on a single VM to the version set in cluster config",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
