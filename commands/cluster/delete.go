// SPDX-License-Identifier: AGPL-3.0-or-later

package cluster

import (
	"errors"

	"github.com/spf13/cobra"
)

func newDeleteCmd(cluster *string, output *string) *cobra.Command {
	return &cobra.Command{
		Use:   "delete",
		Short: "Delete a stopped cluster's directory and config",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
