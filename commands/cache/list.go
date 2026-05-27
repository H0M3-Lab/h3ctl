// SPDX-License-Identifier: AGPL-3.0-or-later

package cache

import (
	"errors"

	"github.com/spf13/cobra"
)

func newListCmd(output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "list",
		Short: "List cached Talos images with size and cluster references",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
