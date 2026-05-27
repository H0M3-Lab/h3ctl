// SPDX-License-Identifier: AGPL-3.0-or-later

package cluster

import (
	"errors"

	"github.com/spf13/cobra"
)

func newStartCmd(cluster *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "start",
		Short: "Boot all VMs, apply Talos config, and bootstrap the cluster",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
