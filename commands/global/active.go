// SPDX-License-Identifier: AGPL-3.0-or-later

package global

import (
	"errors"

	"github.com/spf13/cobra"
)

func NewActiveCmd() *cobra.Command {
	return &cobra.Command{
		Use:   "active",
		Short: "Print the currently active cluster, or nothing if none is set",
		RunE: func(_ *cobra.Command, _ []string) error {
			return errors.New("not yet implemented")
		},
	}
}
