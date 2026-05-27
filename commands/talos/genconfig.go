// SPDX-License-Identifier: AGPL-3.0-or-later

package talos

import (
	"errors"

	"github.com/spf13/cobra"
)

func newGenconfigCmd(cluster *string, vm *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "genconfig",
		Short: "Generate Talos machine configs for all VMs in the cluster",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
