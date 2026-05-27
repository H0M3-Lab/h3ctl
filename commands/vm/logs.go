// SPDX-License-Identifier: AGPL-3.0-or-later

package vm

import (
	"errors"

	"github.com/spf13/cobra"
)

func newLogsCmd(cluster *string, vm *string, output *string) *cobra.Command {
	var follow bool
	cmd := &cobra.Command{
		Use:   "logs",
		Short: "Print VM console output (last 50 lines by default)",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
	cmd.Flags().BoolVarP(&follow, "follow", "f", false, "stream output until interrupted")
	return cmd
}
