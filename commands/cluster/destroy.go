// SPDX-License-Identifier: AGPL-3.0-or-later

package cluster

import (
	"errors"

	"github.com/spf13/cobra"
)

func newDestroyCmd(cluster *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "destroy",
		Short: "Stop VMs, wipe disks, remove services, and delete cluster directory",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
