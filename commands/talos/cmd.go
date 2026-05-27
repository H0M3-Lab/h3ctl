// SPDX-License-Identifier: AGPL-3.0-or-later

package talos

import "github.com/spf13/cobra"

// NewCmd assembles the talos command group.
func NewCmd(cluster *string, vm *string, output *string) *cobra.Command {
	cmd := &cobra.Command{
		Use:   "talos",
		Short: "Talos OS poweruser primitives (genconfig, apply, bootstrap, upgrade)",
	}
	cmd.AddCommand(
		newGenconfigCmd(cluster, vm, output),
		newApplyConfigCmd(cluster, vm, output),
		newBootstrapCmd(cluster, vm, output),
		newKubeconfigCmd(cluster, vm, output),
		newUpgradeCmd(cluster, vm, output),
	)
	return cmd
}
