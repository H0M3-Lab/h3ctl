// SPDX-License-Identifier: AGPL-3.0-or-later

package vm

import (
	"errors"

	"github.com/spf13/cobra"
)

func newWaitAPICmd(cluster *string, vm *string, output *string) *cobra.Command {
	var timeout string
	cmd := &cobra.Command{
		Use:   "wait-api",
		Short: "Block until the Talos API is reachable on a booting VM",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
	cmd.Flags().StringVar(&timeout, "timeout", "5m", "maximum time to wait (e.g. 5m, 300s)")
	return cmd
}
