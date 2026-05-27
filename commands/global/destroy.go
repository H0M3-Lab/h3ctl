// SPDX-License-Identifier: AGPL-3.0-or-later

package global

import (
	"errors"

	"github.com/spf13/cobra"
)

func NewDestroyCmd() *cobra.Command {
	var confirm bool
	cmd := &cobra.Command{
		Use:   "destroy",
		Short: "Wipe ~/.h3ctl entirely (all clusters, cache, and state)",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
	cmd.Flags().BoolVar(&confirm, "confirm", false, "required: skip confirmation prompt")
	return cmd
}
