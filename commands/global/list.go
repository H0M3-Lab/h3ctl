// SPDX-License-Identifier: AGPL-3.0-or-later

package global

import (
	"errors"

	"github.com/spf13/cobra"
)

func NewListCmd() *cobra.Command {
	return &cobra.Command{
		Use:   "list",
		Short: "List all clusters in ~/.h3ctl",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
