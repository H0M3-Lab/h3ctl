// SPDX-License-Identifier: AGPL-3.0-or-later

package cache

import (
	"errors"

	"github.com/spf13/cobra"
)

func newPruneCmd(output *string) *cobra.Command {
	var confirm bool
	cmd := &cobra.Command{
		Use:   "prune",
		Short: "Remove cached images not referenced by any cluster",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
	cmd.Flags().BoolVar(&confirm, "confirm", false, "required: skip confirmation prompt")
	return cmd
}
