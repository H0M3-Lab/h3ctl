// SPDX-License-Identifier: AGPL-3.0-or-later

package config

import "github.com/spf13/cobra"

// NewCmd assembles the config command group.
func NewCmd(cluster *string, vm *string, output *string) *cobra.Command {
	cmd := &cobra.Command{
		Use:   "config",
		Short: "Read and write cluster and VM configuration (h3.yaml)",
	}
	cmd.AddCommand(
		newShowCmd(cluster, vm, output),
		newGetCmd(cluster, vm, output),
		newSetCmd(cluster, vm, output),
		newUnsetCmd(cluster, vm, output),
		newResolveCmd(cluster, vm, output),
	)
	return cmd
}
