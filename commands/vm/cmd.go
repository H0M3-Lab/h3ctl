// SPDX-License-Identifier: AGPL-3.0-or-later

package vm

import "github.com/spf13/cobra"

// NewCmd assembles the vm command group.
func NewCmd(cluster *string, vm *string, output *string) *cobra.Command {
	cmd := &cobra.Command{
		Use:   "vm",
		Short: "Individual VM control (poweruser primitives)",
	}
	cmd.AddCommand(
		newCreateCmd(cluster, vm, output),
		newDeleteCmd(cluster, vm, output),
		newBootCmd(cluster, vm, output),
		newStopCmd(cluster, vm, output),
		newStatusCmd(cluster, vm, output),
		newIPCmd(cluster, vm, output),
		newLogsCmd(cluster, vm, output),
		newRenameCmd(cluster, vm, output),
		newWaitAPICmd(cluster, vm, output),
	)
	return cmd
}
