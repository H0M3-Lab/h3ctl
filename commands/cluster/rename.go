// SPDX-License-Identifier: AGPL-3.0-or-later

package cluster

import (
	"errors"

	"github.com/spf13/cobra"
)

func newRenameCmd(cluster *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "rename <new-name>",
		Short: "Rename a stopped cluster (moves directory, rewrites cluster_name in yaml)",
		Args:  cobra.ExactArgs(1),
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
