/**
 * Copyright 2016 Myrle Krantz
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.fineract.module.stellar.fineractadapter;


import retrofit.http.*;

public interface FineractClientService {
  @GET("/clients/{id}")
  Client findClient(@Header("Authorization") String authorization,
      @Header("X-Mifos-Platform-TenantId") String tenantIdentifier,
      @Path("id") final long id);

  @POST("/savingsaccounts/{accountId}/transactions")
  CommandProcessingResult createSavingsAccountTransaction(
      @Path("accountId") int accountId,
      @Query("command") String command,
      @Body JournalEntryCommand journalEntryCommand);
}
