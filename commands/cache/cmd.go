// SPDX-License-Identifier: AGPL-3.0-or-later

package cache

import "github.com/spf13/cobra"

// NewCmd assembles the cache command group.
func NewCmd(output *string) *cobra.Command {
	cmd := &cobra.Command{
		Use:   "cache",
		Short: "Manage the local Talos image cache (~/.h3ctl/cache/images)",
	}
	cmd.AddCommand(
		newListCmd(output),
		newPruneCmd(output),
		newClearCmd(output),
	)
	return cmd
}
