// SPDX-License-Identifier: AGPL-3.0-or-later

package cache

import (
	"errors"

	"github.com/spf13/cobra"
)

func newClearCmd(output *string) *cobra.Command {
	var confirm bool
	cmd := &cobra.Command{
		Use:   "clear",
		Short: "Remove all cached images regardless of cluster references",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
	cmd.Flags().BoolVar(&confirm, "confirm", false, "required: skip confirmation prompt")
	return cmd
}
