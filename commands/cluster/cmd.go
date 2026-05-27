// SPDX-License-Identifier: AGPL-3.0-or-later

package cluster

import "github.com/spf13/cobra"

// NewCmd assembles the cluster command group.
func NewCmd(cluster *string, output *string) *cobra.Command {
	cmd := &cobra.Command{
		Use:   "cluster",
		Short: "Cluster lifecycle commands",
	}
	cmd.AddCommand(
		newCreateCmd(cluster, output),
		newDeleteCmd(cluster, output),
		newRenameCmd(cluster, output),
		newStartCmd(cluster, output),
		newStopCmd(cluster, output),
		newDestroyCmd(cluster, output),
		newStatusCmd(cluster, output),
		newKubeconfigCmd(cluster, output),
	)
	return cmd
}
