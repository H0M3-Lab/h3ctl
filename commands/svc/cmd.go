// SPDX-License-Identifier: AGPL-3.0-or-later

package svc

import "github.com/spf13/cobra"

// NewCmd assembles the svc command group.
func NewCmd(cluster *string, vm *string, output *string) *cobra.Command {
	cmd := &cobra.Command{
		Use:   "svc",
		Short: "Host service manager control (launchd/systemd) — poweruser commands",
	}
	cmd.AddCommand(
		newListCmd(cluster, vm, output),
		newStopAllCmd(cluster, vm, output),
		newWriteCmd(cluster, vm, output),
		newShowCmd(cluster, vm, output),
		newLoadCmd(cluster, vm, output),
		newUnloadCmd(cluster, vm, output),
		newReloadCmd(cluster, vm, output),
	)
	return cmd
}
